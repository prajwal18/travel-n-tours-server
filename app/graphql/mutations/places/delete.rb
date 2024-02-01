module Mutations
  module Places
    class Delete < GraphQL::Schema::Mutation
      argument :id, ID, required: true

      type String

      def resolve(id:)
        if Place.delete(id).zero?
          'Failed to delete the place'
        else
          'Place has been deleted successfully'
        end
      end
    end
  end
end
