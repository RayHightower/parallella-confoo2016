#!/bin/bash

set -e

PRIMES_PER_CORE=1000000


./prime.elf ${PRIMES_PER_CORE}
