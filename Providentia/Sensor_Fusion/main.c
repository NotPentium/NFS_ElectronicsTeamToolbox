#include "EKF.h"
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float x;
    float y;
    float z;
} Vector3D;

void calculateBodyAcceleration(float yaw, float pitch, float roll, Vector3D earthAcceleration, Vector3D* bodyAcceleration) {
    // Convert angles to radians
    yaw = yaw * 3.14159265f / 180.0;
    pitch = pitch * 3.14159265f / 180.0;
    roll = roll * 3.14159265f / 180.0;

    // Calculate rotation matrix elements
    float cYaw = cos(yaw);
    float sYaw = sin(yaw);
    float cPitch = cos(pitch);
    float sPitch = sin(pitch);
    float cRoll = cos(roll);
    float sRoll = sin(roll);

    // Rotation matrix
    float R[3][3] = {
        {cYaw * cPitch, cYaw * sPitch * sRoll - sYaw * cRoll, cYaw * sPitch * cRoll + sYaw * sRoll},
        {sYaw * cPitch, sYaw * sPitch * sRoll + cYaw * cRoll, sYaw * sPitch * cRoll - cYaw * sRoll},
        {-sPitch, cPitch * sRoll, cPitch * cRoll}
    };

    // Rotate the Earth-fixed acceleration to the body-fixed frame
    bodyAcceleration->x = R[0][0] * earthAcceleration.x + R[0][1] * earthAcceleration.y + R[0][2] * earthAcceleration.z;
    bodyAcceleration->y = R[1][0] * earthAcceleration.x + R[1][1] * earthAcceleration.y + R[1][2] * earthAcceleration.z;
    bodyAcceleration->z = R[2][0] * earthAcceleration.x + R[2][1] * earthAcceleration.y + R[2][2] * earthAcceleration.z;
}

int main() {
    // ... (other includes and setup code)

    ekf_t ekf;
    float euler_ekf[3];

    FILE* inputFile = fopen("testDataset.txt", "r");
    if (!inputFile) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }
    
    FILE* outputFile = fopen("EKF_outputC.txt", "w");
    if (!outputFile) {
        fprintf(stderr, "Error opening output file.\n");
        return 1;
    }

    // Skip the header line
    char buffer[256];
    fgets(buffer, sizeof(buffer), inputFile);

    float delta_time_second = 0.01; // Time step (10 milliseconds) -> (replace with actual time step)

    int i = 0;
    while (!feof(inputFile)) {
        Vector3D accel_samples;
        Vector3D gyro_samples;
        Vector3D mag_samples;

        // Read accelerometer values
        fscanf(inputFile, "%f,%f,%f,", &accel_samples.x, &accel_samples.y, &accel_samples.z);

        // Read gyroscope values
        fscanf(inputFile, "%f,%f,%f,", &gyro_samples.x, &gyro_samples.y, &gyro_samples.z);

        // Read magnetometer values
        fscanf(inputFile, "%f,%f,%f\n", &mag_samples.x, &mag_samples.y, &mag_samples.z);

        // Assuming mag, accel, and gyro are your sensor measurements
        if (i == 0) {
            EKF_init(&ekf, mag_samples.x, mag_samples.y, mag_samples.z, 0.1, 1, 100);
        }

        // Update EKF with sensor measurements
        EKF_update(&ekf, euler_ekf, accel_samples.x, accel_samples.y, accel_samples.z, gyro_samples.x, gyro_samples.y, gyro_samples.z, mag_samples.x, mag_samples.y, mag_samples.z, delta_time_second);

        // Calculate body acceleration
        Vector3D earthAcceleration = {accel_samples.x, accel_samples.y, accel_samples.z};
        Vector3D bodyAcceleration;
        calculateBodyAcceleration(euler_ekf[0], euler_ekf[1], euler_ekf[2], earthAcceleration, &bodyAcceleration);

        // Print the values
        printf("Sample %d:\n", i + 1);
        printf("X: %f m/s^2\n", bodyAcceleration.x);
        printf("Y: %f m/s^2\n", bodyAcceleration.y);
        printf("Z: %f m/s^2\n", bodyAcceleration.z);

        // Write the values to the file
        fprintf(outputFile, "Sample %d:\n", i + 1);
        fprintf(outputFile, "X: %f m/s^2\n", bodyAcceleration.x);
        fprintf(outputFile, "Y: %f m/s^2\n", bodyAcceleration.y);
        fprintf(outputFile, "Z: %f m/s^2\n", bodyAcceleration.z);

        // Increment sample index
        i++;
    }
    fclose(inputFile);
    fclose(outputFile);
    
    return 0;
}