class VkAuth
  class << self
    def authorization_url
      srand
      state ||= Digest::MD5.hexdigest(rand.to_s)
      @vk_url = VkontakteApi.authorization_url(
        scope: %i(
          friends
          groups
          offline
          notify
          messages
        ),
        state: state
      )
    end

    def authorize
      @vk = VkontakteApi.authorize(code: code)
    end

    def new_client
      @vk = VkontakteApi::Client.new(@vk.token)
    end
  end



end
