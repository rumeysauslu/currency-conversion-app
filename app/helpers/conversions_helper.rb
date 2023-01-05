# frozen_string_literal: true
module ConversionsHelper
  def link_to_new(path = nil, text = nil)
    link_to(
      path,
      title: text,
      data: { turbo: false },
      class: 'btn btn-success btn-xs'
    )
  end
end
