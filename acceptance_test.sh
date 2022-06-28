#!/bin/bash
test "$(curl localhost:8000)" = '"Hello World!"'