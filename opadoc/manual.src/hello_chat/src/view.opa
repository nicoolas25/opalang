module View {

  function page_template(content) {
    <>
      <div class="navbar navbar-fixed-top">
        <div class=navbar-inner>
          <div class=container>
            <div id=#logo />
          </>
        </>
      </>
      {content}
    </>
  }

  function user_update(message x) {
    line = <div class="row line">
              <div class="span1 columns userpic" />
              <div class="span2 columns user">{x.author}:</>
              <div class="span13 columns message">{x.text}</>
            </>;
    #conversation =+ line;
    Dom.scroll_to_bottom(#conversation);
  }

  function broadcast(author) {
    text = Dom.get_value(#entry);
    Model.broadcast(~{author, text});
    Dom.clear_value(#entry);
  }

  function chat_html(author) {
    <div id=#conversation class=container-fluid
      onready={function(_) { Model.register_message_callback(user_update)}} />
    <footer class="navbar navbar-fixed-bottom">
      <div class=container>
        <div class=input-append>
          <input id=#entry class=input-xlarge type=text
            onnewline={function(_) { broadcast(author) }}>
          <button class="btn btn-primary" type=button
            onclick={function(_) { broadcast(author) }}>Post</>
        </>
      </>
    </>
  }

  function default_page() {
    author = Random.string(8);
    Resource.page("Opa chat", page_template(chat_html(author)));
  }

}
