module ApplicationHelper
  @my_blockquote = {
    'Quote' => [
      /\[quote\](.*?)\[\/quote\1?\]/mi,
      '<blockquote>\3</blockquote>',
      'Quote with citation',
      '[quote=mike]please quote me[/quote]',
      :quote
    ],      
  }
end
