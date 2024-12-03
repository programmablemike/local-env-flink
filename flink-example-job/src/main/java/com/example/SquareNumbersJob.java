package com.example;

import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

public class SquareNumbersJob {
    public static void main(String[] args) throws Exception {
        // Set up the execution environment
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Create a DataStream of integers
        env.fromElements(1, 2, 3, 4, 5) // Example numbers
                .map(new MapFunction<Integer, Integer>() {
                    @Override
                    public Integer map(Integer value) {
                        return value * value; // Square each number
                    }
                })
                .print(); // Print the squared numbers to the console

        // Execute the Flink job
        env.execute("Square Numbers Job");
    }
}
