require "administrate/base_dashboard"

class PhotoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    votes: Field::HasMany,
    voting_users: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    image_data: Field::Text,
    location: Field::String,
    views: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :votes,
    :voting_users,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :votes,
    :voting_users,
    :image_data,
    :location,
    :views,
  ]

  # Overwrite this method to customize how photos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(photo)
  #   "Photo ##{photo.id}"
  # end
end
