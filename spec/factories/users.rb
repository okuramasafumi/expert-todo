# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                      | Type               | Attributes
# ------------------------- | ------------------ | ---------------------------
# **`id`**                  | `integer`          | `not null, primary key`
# **`created_at`**          | `datetime`         | `not null`
# **`updated_at`**          | `datetime`         | `not null`
# **`email`**               | `string`           | `not null`
# **`encrypted_password`**  | `string(128)`      | `not null`
# **`confirmation_token`**  | `string(128)`      |
# **`remember_token`**      | `string(128)`      | `not null`
#
# ### Indexes
#
# * `index_users_on_email`:
#     * **`email`**
# * `index_users_on_remember_token`:
#     * **`remember_token`**
#

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "test#{i}@example.com" }
    password 'password'
  end
end
