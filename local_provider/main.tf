terraform {
  
}

resource "local_file" "my_file" {
    content = "this is text"
    filename = "/tmp/text.txt"
}