module CarrierWave
  module Storage

    class DropBox < Abstract

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
          file.download
        end

        ##
        # Remove the file from DropBox
        #
        def delete
          file.destroy
        rescue Dropbox::API::Error::NotFound
        end

        ##
        # Returns the url on DropBox's service
        #
        # === Returns
        #
        # [String] file's url
        #
        def url
          @url ||= file.direct_url.url
        rescue Dropbox::API::Error::NotFound
          @url ||= 'FileNotFound'
        end

        def store(file)
          connection.upload(path, ::File.open(file.file){|f| f.read})
        end

      private

        def connection
          @base.connection
        end

        def file
          connection.find @path
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
      # [CarrierWave::Storage::DropBox::File] the stored file
      #
      def store!(file)
        f = CarrierWave::Storage::DropBox::File.new(uploader, self, uploader.store_path)
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
      # [CarrierWave::Storage::DropBox::File] the stored file
      #
      def retrieve!(identifier)
        CarrierWave::Storage::DropBox::File.new(uploader, self, uploader.store_path(identifier))
      end


      def connection
        @connection ||= Dropbox::API::Client.new(:token => uploader.dropbox_access_key, :secret => uploader.dropbox_secret_key)
      end

    end
  end
end


