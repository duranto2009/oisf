package com.revesoft.springboot.web.appregistration;

import java.sql.ResultSet;
import org.springframework.stereotype.Service;

/**
 *
 * @author maruf
 */
@Service
public class DTOMapper {

    // TODO
    public ApplicationDTO mapApplicationDTO(ResultSet resultSet) throws Exception {
        if (resultSet == null) {
            return null;
        }

        return null;
    }
}
