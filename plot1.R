file_name <- 'household_power_consumption.txt'

pwr_cnsmptn <- read.table(file_name, header = TRUE, sep = ';', na.strings='?')
dates <- c('1/2/2007', '2/2/2007')
subset_pwr_cnsmptn <- pwr_cnsmptn[pwr_cnsmptn$Date %in% dates, ]

date_time_info <- paste( subset_pwr_cnsmptn$Date, subset_pwr_cnsmptn$Time )
subset_pwr_cnsmptn$DateTime <- strptime( date_time_info, format = '%d/%m/%Y %H:%M:%S' )

png(filename = 'plot1.png', width = 480, height = 480)
hist(subset_pwr_cnsmptn$Global_active_power,
     breaks=12, col='red',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylab='Frequency')
dev.off()
