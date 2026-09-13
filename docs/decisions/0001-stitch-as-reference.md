# ADR 0001 — Stitch is a visual reference, not runtime code

## Decision

Preserve every Stitch HTML/PNG export, but implement the production interface as Angular components using reusable tokens and application data.

## Why

Generated HTML is optimized for a design preview, not long-term Angular state, accessibility, routing, testing or domain architecture.

## Consequence

Visual parity is verified against `screen.png`, while production implementation remains maintainable.
