## realisticRepairPriceofCar


#Car Repair Script
This script calculates the repair cost of a car based on its current damage and the initial price of the car. The repair cost will be calculated as a percentage of the initial price, with the percentage determined by the current damage. Additionally, there are also minimum and maximum prices set for the repair.

##How to Use
Add the script to your FiveM server's resources directory.
Add start repair to your server's server.cfg file.
When a player attempts to repair their car, the script will calculate the repair cost and check if the player has enough money to pay for the repair. If the player has enough money, the car will be repaired. If not, the player will be notified that they do not have enough money.
Configuration
You can adjust the minimum and maximum repair cost, and the repair cost factor by modifying the MIN_REPAIR_COST, MAX_REPAIR_COST and REPAIR_FACTOR variables at the beginning of the script respectively.

##Dependencies
This script requires the vRP and FiveM resource to be installed on your server.

#Note
Please make sure to follow the FiveM's rules and regulations, and to test the script thoroughly before releasing it to the public.
