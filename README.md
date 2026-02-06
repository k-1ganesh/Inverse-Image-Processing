# Compressive Sensing Image Reconstruction using OMP and CoSaMP

This repository contains a MATLAB implementation of **Orthogonal Matching Pursuit (OMP)** and **Compressive Sampling Matching Pursuit (CoSaMP)** for image reconstruction under the compressive sensing framework.

The project reconstructs a **32×32 grayscale image** from a reduced number of linear measurements and evaluates reconstruction quality using **RMSE**.

---

## Problem Overview

Given:

- A sparse representation of an image in a known basis
- A reduced set of linear measurements

Goal:

- Reconstruct the original image using sparse recovery algorithms
- Compare OMP and CoSaMP in terms of reconstruction quality

---

## Algorithms Implemented

- **Orthogonal Matching Pursuit (OMP)**
- **Compressive Sampling Matching Pursuit (CoSaMP)**

---

## Experimental Setup

- Image size: **32 × 32**
- Measurement matrix: Random Rademacher (±1 with equal probability)
- Sparsifying basis: DCT
- Metrics:
  - RMSE vs sparsity (k)
  - RMSE vs number of measurements (m)

---

## How to Run

1. Open MATLAB
2. Navigate to the `src/` directory
3. Run:

```matlab
experiment


```
