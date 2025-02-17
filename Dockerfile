name: Pull Docker Image

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  pull-image:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Pull Docker image
        run: |
          docker pull sarveshsd/assignment

      - name: Verify image
        run: |
          docker images | grep my-docker-image