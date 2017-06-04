@test "container is running" {
  run docker-compose ps alpine
  [ ${status} -eq 0 ]
}

@test "image has ci-build-url metadata" {
  if [ -z "${CIRCLECI}" ]; then
    skip "This test only runs on CircleCI"
  fi

  image_id=$(docker-compose images -q alpine 2> /dev/null)
  run docker inspect -f '{{ index .Config.Labels "io.github.jumanjiman.ci-build-url" }}' ${image_id}
  [[ ${output} =~ circleci.com ]]
}

@test "image has build-date metadata" {
  image_id=$(docker-compose images -q alpine 2> /dev/null)
  run docker inspect -f '{{ index .Config.Labels "io.github.jumanjiman.build-date" }}' ${image_id}
  [[ "${output}" = "${BUILD_DATE}" ]]
}

@test "image has vcs-ref metadata" {
  image_id=$(docker-compose images -q alpine 2> /dev/null)
  run docker inspect -f '{{ index .Config.Labels "io.github.jumanjiman.vcs-ref" }}' ${image_id}
  [[ "${output}" = "${VCS_REF}" ]]
}
