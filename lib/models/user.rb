require_relative 'application_record'

class User < ApplicationRecord
  # extend ActiveSupport::Concern
  include AASM

  aasm column: :state, no_direct_assignment: true do
    state :new, initial: true
    state :signed
    state :token_expired
    state :not_signed
    state :auth_link_send

    # after_all_transitions :add_queries, :set_expired_at_state

    # event :assign_again do
    #   transitions from: :rejected, to: :assigned_again, guards: [:current_user_servant?], after: :after_assign_again
    # end
  end

end
