module Resolvers
  module Places
    class PlacesResolver < BaseResolver
      argument :skip, Int, required: false
      argument :take, Int, required: false
      type [Types::PlaceType], null: false
      def resolve(skip: 0, take: 10)
        Place.order(:id).offset(skip).limit(take)
      end
    end
  end
end
