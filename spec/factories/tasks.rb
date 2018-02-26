# ## Schema Information
#
# Table name: `tasks`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`user_id`**      | `integer`          | `not null`
# **`title`**        | `string`           | `default(""), not null`
# **`status`**       | `integer`          | `default("open"), not null`
# **`description`**  | `string`           | `default(""), not null`
# **`due_date`**     | `datetime`         |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_tasks_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`user_id => users.id`**
#

FactoryBot.define do
  factory :task do
    user nil
    title "MyString"
    status 1
    description "MyString"
    due_date "2017-12-02"
  end
end
