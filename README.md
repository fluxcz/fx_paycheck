# Flux Paycheck

A simple paycheck script for ESX that automatically pays players based on their job.

## Features

-   **Job Based Pay:** Give players a salary based on their current job.
-   **Custom Pay Interval:** You decide how often players receive their paycheck.
-   **Optional Taxes:** Automatically deduct taxes from each paycheck.
-   **Multiple Pay Methods:**
    -   `bank`: Deposit money directly to the bank.
    -   `cash`: Give players cash in hand.
-   **Choice of Notification Styles:**
    -   `esx`: Use standard ESX notifications.
    -   `ox_lib`: Use modern `ox_lib` notifications.
-   **Easy to Configure:** Everything is in one simple config file.

## Requirements

-   ESX Framework (`es_extended`)
-   `ox_lib` (only if you want to use `ox_lib` notifications)

## Installation

1.  Download the script.
2.  Put the `fx_paycheck` folder into your `resources` directory.
3.  Open `config.lua` and change the settings to your liking.
4.  Add `ensure fx_paycheck` to your `server.cfg`.
5.  Restart your server.

## Configuration

All settings are located in the `config.lua` file.
