module Endpoints
  class Versions < Base
    namespace "/versions" do
      get do
        versions = Version.reverse(:number)
        versions = versions.where(platform: params['platform']) if params['platform']
        encode serialize(versions)
      end

      get "/:identity" do |identity|
        version = Version[number: identity]
        begin
          version = Version[id: identity] unless version
        rescue
          raise Pliny::Errors::NotFound
        end
        raise Pliny::Errors::NotFound unless version
        encode serialize(version)
      end

      private

      def serialize(data, structure = :default)
        Serializers::Version.new(structure).serialize(data)
      end
    end
  end
end
