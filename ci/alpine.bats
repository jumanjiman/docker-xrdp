@test "container is running" {
  run docker-compose ps alpine
  [ ${status} -eq 0 ]
}
