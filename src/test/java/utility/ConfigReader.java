package utility;

import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigReader {

    public static String getEnv() {
        String testEnv = System.getenv("environment");
        return StringUtils.isEmpty(testEnv) ? "qa" : testEnv;
    }

    public static String getTenant() {
        String tenantName = System.getenv("tenantName");
        return StringUtils.isEmpty(tenantName) ? "dummy" : tenantName;
    }

    public static Properties getTestData() {
        InputStream inputStream;
        String tenantName = getTenant();
        String env = getEnv();
        String filePath = "/configurations/" + tenantName + "-" + env + "-data.properties";

        inputStream = ConfigReader.class.getResourceAsStream(filePath);
        try {
            Properties configProperties = new Properties();
            configProperties.load(inputStream);
            return configProperties;
        } catch (IOException ioException) {
            throw new RuntimeException(ioException.getMessage());
        }
    }

    public static Properties getTestElements() {
        InputStream inputStream;
        String tenantName = getTenant();
        String env = getEnv();
        String filePath = "/configurations/" + tenantName + "-elements.properties";

        inputStream = ConfigReader.class.getResourceAsStream(filePath);
        try {
            Properties configProperties = new Properties();
            configProperties.load(inputStream);
            return configProperties;
        } catch (IOException ioException) {
            throw new RuntimeException(ioException.getMessage());
        }
    }

}
