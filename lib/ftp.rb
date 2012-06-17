require 'net/ftp'
module CarrierWave
  module Storage

    class Ftp < Abstract

      class File

        def initialize(uploader, base, path)
          @uploader = uploader
          @path = path
          @base = base
        end

        ##
        # Returns the current path of the file
        #
        # === Returns
        #
        # [String] A path
        #
        def path
          @path
        end

        ##
        # Reads the contents of the file
        #
        # === Returns
        #
        # [String] contents of the file
        #
        def read
          connection.getbinaryfile remote_path, nil
        end

        ##
        # Remove the file from FTP server
        #
        def delete
          connection.delete remote_path
        rescue Net::FTPPermError
        end

        ##
        # Returns the FTP url
        #
        # === Returns
        #
        # [String] file's url
        #
        def url
          @url ||= "#{@base.web_host}/#{remote_path}"
        end

        def store(file)
          mkdir_p(::File.dirname(path))
          connection.putbinaryfile(file.file, remote_path)
        end

        def content_type
          'image/jpeg'
        end

        def mkdir_p(path)
          begin
            connection.chdir remote_path(path)
          rescue Net::FTPPermError
            tmp_path = ''
            remote_path(path).split('/').each do |dir|
              tmp_path += '/' + dir
              begin
                connection.mkdir tmp_path
              rescue Net::FTPPermError
              end
            end
          end
        end

      private

        def connection
          @base.connection
        end

        def remote_path(path=@path)
          ::File.join(@base.base_dir, path)
        end

      end

      ##
      # Store the file on dropbox
      #
      # === Parameters
      #
      # [file (CarrierWave::SanitizedFile)] the file to store
      #
      # === Returns
      #
      # [CarrierWave::Storage::Ftp::File] the stored file
      #
      def store!(file)
        f = CarrierWave::Storage::Ftp::File.new(uploader, self, uploader.store_path)
        f.store(file)
        f
      end
      # Do something to retrieve the file
      #
      # @param [String] identifier uniquely identifies the file
      #
      # [identifier (String)] uniquely identifies the file
      #
      # === Returns
      #
      # [CarrierWave::Storage::Ftp::File] the stored file
      #
      def retrieve!(identifier)
        CarrierWave::Storage::Ftp::File.new(uploader, self, uploader.store_path(identifier))
      end

      def host
        uploader.ftp_host
      end

      def web_host
        uploader.ftp_web_host
      end

      def base_dir
        '/' + uploader.ftp_base_dir.to_s
      end

      def connection
        self.class.connection(host, uploader)
      end

      def self.connection(host, uploader)
        return @connection unless @connection.nil?
        @connection = Net::FTP.new(host, uploader.ftp_user, uploader.ftp_password)
        @connection.passive = true
        ObjectSpace.define_finalizer(@connection, lambda {|id| ObjectSpace._id2ref(id).close})
        @connection
      end

    end
  end
end


