

# FSM: Timer Control


## Objective

Create a Finite-State Machine (FSM) that controls a timer with the following behavior:

1. **Start Condition**: The timer is started when a specific pattern (`1101`) is detected on the input.
2. **Shift in Duration**: The FSM shifts in 4 more bits to determine the duration to delay.
3. **Wait for Counting**: The FSM waits for the counters to finish counting.
4. **Notify & Acknowledge**: The FSM notifies the user when the timer expires and waits for user acknowledgment before resetting.

## Problem Details

You are to implement **only** the FSM that controls the timer. The data path, including counters and comparators, is not part of this exercise.

### Inputs

- **data**: Serial data input pin.
- **done_counting**: Indicates when the counters have finished counting.
- **ack**: Acknowledgment from the user.

### Outputs

- **shift_ena**: Asserted for exactly 4 clock cycles to shift in the duration bits.
- **counting**: Asserted when waiting for the counters to finish.
- **done**: Asserted to notify the user that the timer has timed out.

### FSM Behavior

1. **Initial State**: 
   - The FSM starts in a state where it searches for the sequence `1101` on the data input.
   
2. **Pattern Detected (`1101`)**:
   - When `1101` is detected, the FSM asserts `shift_ena` for exactly 4 clock cycles to shift in the duration bits.

3. **Counting State**:
   - After shifting in the duration, the FSM asserts the `counting` output and waits until `done_counting` is high.

4. **Timer Expired**:
   - Once `done_counting` is high, the FSM asserts the `done` output to notify the user that the timer has expired.

5. **Acknowledgment**:
   - The FSM waits for the `ack` input to be high before resetting to search for the next occurrence of the start sequence (`1101`).

### Example Input/Output Sequence

The following is an example of the expected behavior:

| Clock Cycle | Input: data | Output: shift_ena | Output: counting | Output: done | Input: done_counting | Input: ack |
|-------------|-------------|-------------------|------------------|--------------|----------------------|------------|
| 1           | 1           | 0                 | 0                | 0            | x                    | x          |
| 2           | 1           | 0                 | 0                | 0            | x                    | x          |
| 3           | 0           | 0                 | 0                | 0            | x                    | x          |
| 4           | 1           | 0                 | 0                | 0            | x                    | x          |
| 5           | x           | 1                 | 0                | 0            | x                    | x          |
| 6           | x           | 1                 | 0                | 0            | x                    | x          |
| 7           | x           | 1                 | 0                | 0            | x                    | x          |
| 8           | x           | 1                 | 0                | 0            | x                    | x          |
| 9           | x           | 0                 | 1                | 0            | 0                    | x          |
| 10          | x           | 0                 | 1                | 0            | 1                    | x          |
| 11          | x           | 0                 | 0                | 1            | x                    | 0          |
| 12          | x           | 0                 | 0                | 1            | x                    | 1          |
| 13          | x           | 0                 | 0                | 0            | x                    | x          |

Note: The 'x' states indicate that the FSM does not care about the particular input signal during that cycle.
