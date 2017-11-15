# ## Schema Information
#
# Table name: `items`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`user_id`**      | `integer`          |
# **`title`**        | `string`           | `default(""), not null`
# **`status`**       | `integer`          | `default("open"), not null`
# **`description`**  | `string`           |
# **`due_date`**     | `date`             |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_items_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`user_id => users.id`**
#

class Item < ApplicationRecord
  belongs_to :user

  validates :title, :status, presence: true

  enum status: {open: 1, closed: 2, deleted: 3}
end
