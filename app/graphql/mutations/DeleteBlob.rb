module Mutations
    class DeleteBlob < GraphQL::Schema::Mutation
      argument :url, String, required: true

      type String
      def resolve(url:)
        blob_id = url.match(/\/([a-zA-Z0-9_-]+)\?/)[1]
        blob = ActiveStorage::Blob.find_signed(blob_id)
        blob.purge
        "Image delete successfully"
      rescue StandardError => e
        "Failed to delete image. Sorry! try again"
      end
    end
end
