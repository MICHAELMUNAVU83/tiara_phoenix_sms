defmodule TiaraPhoenixSms.Repo do
  use Ecto.Repo,
    otp_app: :tiara_phoenix_sms,
    adapter: Ecto.Adapters.Postgres
end
