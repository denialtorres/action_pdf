![Screenshot 2024-11-30 at 2 45 03 p m](https://github.com/user-attachments/assets/61bb88ee-8ac7-478b-a75f-0865c32caeb8)


# ACTION PDF

docker
access to the shell
```
  docker-compose exec app /bin/bash
```

install action text
```
  bundle exec rails action_text:install
```

db
```
bundle exec rails db:setup
bundle exec rails db:migrate
```

run the server inside the container
```
bundle exec rails s -b 0.0.0.0
```


precompile
```
bundle exec rails assets:precompile
```

generate PDF with Puppeteer gem
```ruby
  def get_html
    <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="utf-8"/>
      <title>Test Page</title>
      <meta content="width=1000px" name="viewport">
    </head>
    <body>
      <main>
        <section>
          <div class='text_content'>
            <h1>Test Headline</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac tincidunt vitae semper quis lectus nulla at. Ac turpis egestas integer eget aliquet. Tristique senectus et netus et malesuada fames ac. Urna nec tincidunt praesent semper feugiat nibh. Est velit egestas dui id. Convallis posuere morbi leo urna molestie at elementum eu. Purus ut faucibus pulvinar elementum integer enim neque volutpat. Faucibus nisl tincidunt eget nullam. Amet purus gravida quis blandit turpis cursus in hac. Commodo sed egestas egestas fringilla phasellus. In dictum non consectetur a erat nam at lectus.</p>
          </div>
        </section>
      </main>
    </body>
    </html>
    HTML
  end


  Puppeteer.launch(headless: "new", args: ["--no-sandbox"]) do |browser|
    page = browser.new_page
    page.set_content(get_html, wait_until: %i[load domcontentloaded])
    page.emulate_media_type("print")
    page.pdf(
      {
        path: Rails.root.join("public", "report.pdf"),
        landscape: false,
        format: "A4",
        margin: { top: "3cm", right: "2cm", bottom: "3cm", left: "2cm" },
        displayHeaderFooter: true,
        headerTemplate: "<span style=\"font-size:10px;line-height:1.3;margin:0;\">Custom Header</span>",
        footerTemplate: "<span style=\"font-size:10px;line-height:1.3;margin:0;\">Custom Footer</span>"
      }
    )
  end
```
generate PDF with Grover gem
```ruby
  # Grover.new accepts a URL or inline HTML and optional parameters for Puppeteer
  grover = Grover.new('https://google.com', format: 'A4')

  # Get an inline PDF
  pdf = grover.to_pdf
```
