#!/bin/bash

# Simple Apache Benchmark script
# Usage: ./run-ab-test.sh [URL] [TotalRequests] [Concurrency]

URL=${1:-http://127.0.0.1:5000/api/hello}
TOTAL=${2:-1000}
CONCURRENCY=${3:-50}
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

OUTFILE="ab_results_$DATE.txt"

echo "Running Apache Benchmark..."
echo "Target: $URL"
echo "Requests: $TOTAL"
echo "Concurrency: $CONCURRENCY"
echo "Saving results to: $OUTFILE"
echo "--------------------------------------------"

ab -n $TOTAL -c $CONCURRENCY "$URL" > "$OUTFILE"

echo "✅ Done. Results saved to $OUTFILE"
