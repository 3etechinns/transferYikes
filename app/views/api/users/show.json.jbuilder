json.user do
    json.set! @user.id do
        json.partial! "api/users/user", user: @user
    end
end