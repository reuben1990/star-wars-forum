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
  def broadcast(channel, &block)  
    message = {:channel => channel, :data => capture(&block)}  
    uri = URI.parse("http://localhost:9292/faye")  
    Net::HTTP.post_form(uri, :message => message.to_json)  
  end  
end
