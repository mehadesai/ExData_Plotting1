file_name <- 'household_power_consumption.txt'

pwr_cnsmptn <- read.table(file_name, header = TRUE, sep = ';', na.strings='?')
dates <- c('1/2/2007', '2/2/2007')
subset_pwr_cnsmptn <- pwr_cnsmptn[pwr_cnsmptn$Date %in% dates, ]

date_time_info <- paste( subset_pwr_cnsmptn$Date, subset_pwr_cnsmptn$Time )
subset_pwr_cnsmptn$DateTime <- strptime( date_time_info, format = '%d/%m/%Y %H:%M:%S' )

png("plot3.png", width=480, height=480)

plot(subset_pwr_cnsmptn$DateTime, subset_pwr_cnsmptn$Sub_metering_1,
     type='l',
     xlab='', ylab='Energy sub metering')
lines(subset_pwr_cnsmptn$DateTime, subset_pwr_cnsmptn$Sub_metering_2,
      col='red')
lines(subset_pwr_cnsmptn$DateTime, subset_pwr_cnsmptn$Sub_metering_3,
      col='blue')
legend('topright', lty=1,
       col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
