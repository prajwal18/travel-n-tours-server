module Mutations
  class DeleteBlobPayload < Types::BaseObject
    field :event, Types::EventType, null: true
    field :place, Types::PlaceType, null: true
    field :error, [String], null: true
  end

  class DeleteBlob < GraphQL::Schema::Mutation
    argument :url, String, required: true

    type DeleteBlobPayload
    def resolve(url:)
      regex = %r{active_storage/blobs/redirect/(.*)/}
      signed_blob_id = url.match(regex)[1]
      blob = ActiveStorage::Blob.find_signed(signed_blob_id)
      # blob.purge is not working. That is why the below code is written
      blob_id = blob.id
      attachment = blob.attachments[0]
      model = attachment.record_type
      model_id = attachment.record_id
      record = model.constantize.find(model_id)
      record.pictures.find_by(blob_id:).purge
      record.save
      model == 'Place' ? { place: record } : { event: record }
    rescue StandardError => _e
      { error: 'Failed to delete the image' }
    end
  end
end
