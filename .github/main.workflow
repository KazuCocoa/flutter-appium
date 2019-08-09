workflow "ci" {
  on = "push"
  resolves = ["test"]
}

action "test" {
  uses = "test"
}
