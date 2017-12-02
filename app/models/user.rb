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
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_remember_token`:
#     * **`remember_token`**
#

class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true, uniqueness: true

  has_many :tasks, dependent: :destroy
end
