module Management
  class PhotoSuggestionsController < ManagementController
    expose(:photo)
    expose(:photo_suggestion, attributes: :photo_suggestion_params)

    before_action :find_photo_suggestion, only: [:edit, :update]

    def create
      photo_suggestion.assign_attributes(photo: photo, user: current_user)
      photo_suggestion.save
    end

    def update
      photo_suggestion.update photo_suggestion_params
    end

    private

    def find_photo_suggestion
      self.photo_suggestion = current_user.photo_suggestions.find(params[:id])
    end

    def photo_suggestion_params
      params.require(:photo_suggestion).permit(:title, :description, :year, :place, :people)
    end
  end
end
