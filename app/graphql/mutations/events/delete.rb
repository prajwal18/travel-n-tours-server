module Mutations
  module Events
    class Delete < GraphQL::Schema::Mutation
      argument :id, ID, required: true

      type String

      def resolve(id:)
        if Event.delete(id).zero?
          'Failed to delete the event'
        else
          'Event has been deleted successfully'
        end
      end
    end
  end
end
