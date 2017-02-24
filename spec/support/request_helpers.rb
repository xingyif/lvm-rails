module RequestHelpers
  def sign_in_auth(user = double('user'))
    if user.nil?
      reject_auth user
    else
      allow_auth user
    end
  end

  private

  def allow_auth(user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(request).to receive(:current_user).and_return(user)
  end

  def reject_auth(user)
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden,
                                                                      scope:
                                                                          user)
    allow(request).to receive(:current_user).and_return(nil)
  end
end
