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

import java.util.Date;

@Configuration
class LoadDatabase {

    private static final Logger log = LoggerFactory.getLogger(LoadDatabase.class);

    @Bean
    CommandLineRunner initDatabaseStaff(StaffRepository repository) {

        return args -> {
            log.info("Preloading " + repository.save(new Staff("ST001","Linh","Tran",new Date(1997-1900,12-1,15),1l,1l,1l,new Date(2022-1900,01-1,01),1)));
            log.info("Preloading " + repository.save(new Staff("ST002","Quoc","Tran",new Date(1997-1900,04-1,15),1l,1l,1l,new Date(2022-1900,01-1,01),1)));
            log.info("Preloading " + repository.save(new Staff("ST003","Phuong","Nguyen",new Date(1997-1900,04-1,15),1l,1l,1l,new Date(2022-1900,01-1,01),1)));
            log.info("Preloading " + repository.save(new Staff("ST004","Trinh","Le",new Date(1997-1900,04-1,15),1l,1l,1l,new Date(2022-1900,01-1,01),1)));
        };
    }

    @Bean
    CommandLineRunner initDatabaseBranch(BranchRepository repository) {

        return args -> {
            log.info("Preloading " + repository.save(new Branch(null,"BR01","Headquarters",1)));
            log.info("Preloading " + repository.save(new Branch(null,"BR02","Phnom Penh Branch",1)));
            log.info("Preloading " + repository.save(new Branch(null,"BR03","Siem Reap Branch",1)));
        };
    }

    @Bean
    CommandLineRunner initDatabaseDepartment(DepartmentRepository repository) {

        return args -> {
            log.info("Preloading " + repository.save(new Department(null,"DE01","CNTT",1)));
            log.info("Preloading " + repository.save(new Department(null,"DE02","Digital Bank",1)));
        };
    }

    @Bean
    CommandLineRunner initDatabasePosition(PositionRepository repository) {

        return args -> {
            log.info("Preloading " + repository.save(new Position(null,"PO01","Officer",1)));
            log.info("Preloading " + repository.save(new Position(null,"PO02","Manager",1)));
            log.info("Preloading " + repository.save(new Position(null,"PO02","Branch Director",1)));
        };
    }
}
