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

FactoryBot.define do
  factory :item do
    user
    title "MyString"
    status 1
    description "MyString"
    due_date "2017-11-10"
  end
end
