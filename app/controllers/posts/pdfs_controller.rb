class Posts::PdfsController < ApplicationController
  def show
    @post = Post.find(params[:post_id])

    html_content = render_to_string(partial: "posts/pdfs/post", locals: { post: @post })

    grover = Grover.new(html_content)
    pdf = grover.to_pdf

    send_data pdf, filename: "#{@post.title}.pdf", type: "application/pdf", dispostion: "inline"
  end
end
