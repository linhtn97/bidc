package com.tnl.staffservice.api.configuration;

import com.tnl.staffservice.entity.Branch;
import com.tnl.staffservice.entity.Department;
import com.tnl.staffservice.entity.Position;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.repository.BranchRepository;
import com.tnl.staffservice.repository.DepartmentRepository;
import com.tnl.staffservice.repository.PositionRepository;
import com.tnl.staffservice.repository.StaffRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.Date;


@Configuration
class LoadDatabase {

    private static final Logger log = LoggerFactory.getLogger(LoadDatabase.class);

    @Bean
    CommandLineRunner initDatabase(StaffRepository repository) {

        return args -> {
            log.info("Preloading " + repository.save(new Staff(null,"ST001","Linh","Tran",new Date(1997,04,15),0l,0l,0l,new Date(2022,01,01),1)));
            log.info("Preloading " + repository.save(new Staff(null,"ST002","Quoc","Tran",new Date(1997,04,15),0l,0l,0l,new Date(2022,01,01),1)));
            log.info("Preloading " + repository.save(new Staff(null,"ST003","Phuong","Nguyen",new Date(1997,04,15),0l,0l,0l,new Date(2022,01,01),1)));
            log.info("Preloading " + repository.save(new Staff(null,"ST004","Trinh","Le",new Date(1997,04,15),0l,0l,0l,new Date(2022,01,01),1)));
        };
    }

//    @Bean
//    CommandLineRunner initDatabase(BranchRepository repository) {
//
//        return args -> {
//            log.info("Preloading " + repository.save(new Branch(null,"BRANCH01","Headquarters",1)));
//            log.info("Preloading " + repository.save(new Branch(null,"BRANCH02","Phnom Penh Branch",1)));
//            log.info("Preloading " + repository.save(new Branch(null,"BRANCH03","Siem Reap Branch",1)));
//        };
//    }
//
//    @Bean
//    CommandLineRunner initDatabase(DepartmentRepository repository) {
//
//        return args -> {
//            log.info("Preloading " + repository.save(new Department(null,"DE01","CNTT",1)));
//            log.info("Preloading " + repository.save(new Department(null,"DE02","Digital Bank",1)));
//        };
//    }
//
//    @Bean
//    CommandLineRunner initDatabase(PositionRepository repository) {
//
//        return args -> {
//            log.info("Preloading " + repository.save(new Position(null,"PO01","Officer",1)));
//            log.info("Preloading " + repository.save(new Position(null,"PO02","Manager",1)));
//            log.info("Preloading " + repository.save(new Position(null,"PO02","Branch Director",1)));
//        };
//    }
}
