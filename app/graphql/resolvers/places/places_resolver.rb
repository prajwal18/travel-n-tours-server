module Resolvers
  module Places
    class PlacesResolver < BaseResolver
      argument :skip, Int, required: false
      argument :take, Int, required: false
      type [Types::PlaceType], null: false
      def resolve(skip: 0, take: 0)
        if skip && take != 0
          Place.order(:id).offset(skip).limit(take)
        else
          Place.order(:id).all
        end
      end
    end
  end
end
