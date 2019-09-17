package com.revesoft.springboot.web.datamigratortool.Scheduler;

import com.revesoft.springboot.web.datamigratortool.DataMigrator.DataMigrator;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * Created by reve on 4/19/2018.
 */
@Configuration
@EnableAsync
@EnableScheduling
public class TaskScheduler{

    final private Logger logger = LogManager.getLogger(TaskScheduler.class);
    @Autowired
    DataMigrator dataMigrator;

    @Value("${scheduling.enabled}")
    private boolean run;

    @Scheduled(cron="${cron.expression}")
    public void dataResfresh() {

        System.out.println("run = "+run);
        if(run) {
            System.out.println("Scheduler Called ");
            try {
                dataMigrator.migrate();
            } catch (Exception e) {
                logger.error("error", e);
                e.printStackTrace();
            }
        }

    }
}
