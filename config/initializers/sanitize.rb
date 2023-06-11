class Sanitize
  module Config
    TELEGRAM = freeze_config(
      elements: %w[b strong i em u ins s strike del tg-spoiler a tg-emoji code pre]
    )
  end
end
