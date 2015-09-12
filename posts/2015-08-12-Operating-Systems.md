---
title: Operating Systems
---

&lt;2015-07-28&gt;
==================

-   An operating system is a program that allows us to create a
    computing environment such as interfacing with hardware and user
    which includes handling the I/O and other devices.

-   A program loaded into the memory is called a **process**.

-   Examples: Unix, GNU/Linux, Windows, Macintosh, etc.

-   There are two ways in which we can process applications

    1.  **Serial processing**

    2.  **Multi programming**: in this method, the CPU is sort of shared
        between many processes, i.e., the CPU need not wait for one
        process to complete its execution; at a time more than once
        process can be loaded into the memory and CPU switches back and
        forth between different processes.

    Obviously, the multi programming method is better (as far as
    execution time is is concerned) as it makes sure that the maximum
    amount of resources are used.

-   **Time Sharing**: is an extension of the multi programming method,
    but here, the CPU switches back and forth so fast that each of the
    processes can interact with the system (in some sense, process in a
    parallel manner.)

-   There are several jobs that are kept in the main memory ready to be
    executed, the CPU has to somehow choose a job among them to be
    executed next. This choice is made by the **scheduling algorithm**
    and this is called CPU Scheduling.

-   A **trap** (or an **exception**) is a software-generated interrupt
    caused either by an error or by a specific request from a user
    program

-   Modes of operation: a bit, called **mode bit** is added to the
    hardware of the computer to indicate the current mode of operation.

    1.  **user mode**:

    2.  **kernel mode** (also called supervisor mode, system mode, or
        privileged mode.)

    When the computer system is executing on the behalf of the user
    application, the system is in the user mode and when a user
    application requires a service from the Operating system (via system
    calls), there should be a transition from the user mode to the
    kernel mode.

&lt;2015-07-29&gt;
==================

-   Some terminology:

    -   Process or Job: a program that is executing.

    -   Text section: the program code.

    -   Program counter: the address of the next instruction.

    -   Stack: contains temporary data such as function parameters,
        return addresses, return addresses and local variables.

    -   Data section: contains global variables.

    -   Heap: where memory is dynamically allocated during process
        run time.

    -   Job queue: processes that enters a system are put into
        this queue.

    -   Ready queue: processes in main memory that are ready and waiting
        to execute are placed in this queue.

    -   Device queue: processes that wait for a device; each device has
        its own device queue, for example, I/O queue.

    -   Scheduler: processes migrate among various queues throughout its
        lifetime; hence the operating system must select processes for
        such migration, this is the purpose of a scheduler.

    -   Context switch: the task of switching the CPU to another
        process; this requires the state save of the current process and
        a state restore of a different process.

-   Process States:

    1.  New: A new process that is being created.

    2.  Running: Instructions are being executed

    3.  Waiting: The process is waiting for some event to occur (for
        example, I/O or a signal)

    4.  Ready: The process is waiting to be assigned to a processor.

    5.  Terminated: The process has finished execution.

-   The process control block (the structure `task_struct`) in Linux
    consists of the following:

    -   `pid_t pid`: process id.

    -   `long state`: process state.

    -   `unsigned int time_slice`: scheduling information. (this is an
        interesting fact; in pintos, we don't have this; probably I'm
        supposed to implement this!)

    -   `struct files_struct *files`: list of 2open files.

    -   `struct mm_struct *mm`: address space of this program.

-   Types of Scheduler:

    1.  Long term scheduler or job scheduler: this one schedules
        processes that are spooled to a mass-storage/disk. Basically,
        this scheduler loads them into memory for execution.

        The duration at which this is invoked is typically large and is
        suitable for use in servers

    2.  Short term scheduler or CPU scheduler: this one selects from
        processes that are ready to execute and allocates the CPU to one
        of them.

        This is typically invoked in every 100ms and is suitable for
        common use, like in a personal computer.

    3.  Medium term scheduler: I don't know what this does exactly, but
        it is executed more frequently than the long term scheduler and
        less frequently than the short term scheduler.

-   Types of queues (non-exhaustive):

    1.  **Job queue**: this queue consists of all processes in
        the system.

    2.  **Ready queue**: the processes that are ready to execute. (I
        think that the scheduler has to deal with this one.)

    3.  **Device queue**: contains the lists of all processes that are
        waiting for a device (the device can be I/O too.)

-   Example of forking: \~/area51/os/fork.c

-   Forking: this will create a copy of the process (this copy is called
    as child).

    In C language, this can be achieved by making use of `pid_t
     fork()` function available from the header `unistd.h`. Note that
    the type `pid_t` is inherited from the header `sys/types.h`.

    -   \[ \] The fork function behaves differently in the child and
        parent process. In the child process, the value returned by fork
        function is zero and in the parent process, the fork function
        returns the process id of the child that was forked. Note that a
        negative value returned by fork function indicates that the
        fork failed. (When can a fork fail, by the way?)

    -   A parent can kill the child for a variety of reasons (no
        pun intended). For example, the child has exceeded its usage of
        resources, task assiged to the child is no longer required or
        that the parent is exiting and that the operating system does
        not allow the child to continue if its parent terminates.

    -   In UNIX, use the function `exit()` to terminate a process and we
        can use `wait()`. The wait function basically waits for a state
        change to happen in the child. Valid state changes are: the
        child is terminated, the child was stopped by a signal or the
        child is resumed by a signal. Note that performing a wait
        process for a terminated child allows the system to release
        the resources. Refer `wait(2)` in the man pages. The function
        `waitid()` can be used to get precise control over the child
        that we are waiting for, i.e., this function takes a pid
        as argument.

    -   The textbook mentions that there are some operating systems that
        does not allow a child to exist if its parent has
        already terminated. This phenomenon is referred to as
        **cascading termination**.

        I think that Linux does not follow cascading termination. Text
        book mentions that for orphaned processes (processes with no
        parents, Linux and Unix assigns a process known as `init` as
        their parent.)

-   **Context Switch**

    Interrupts can cause the operating system to change a CPU from the
    current task to run a kernel routine. When such an interrupt occurs,
    the system has to change the current context of the process on the
    CPU so that it can restore it at a later period of time.

    Switching the CPU to another process requires performing a sate save
    of the current process and a state restore of a different process.
    This task is called as **context switch**.

    When a context switch occurs, the kernel saves the state in the
    current process's PCB (Process Control Block) and loads saved
    context of the to-be running process.

&lt;2015-07-30&gt;
==================

-   In a multi programming system, we do not wish to waste the time at
    which CPU remains idle. So basically, when CPU is not in use, we
    shall pick a process from the ready queue and allocate CPU for it.
    This is done by the short-term scheduler.

-   When does CPU-Scheduling decisions happen?

    1.  Process switch from running to waiting state.

    2.  Process switches from running to waiting state.

    3.  Process switches from waiting state to ready state.

    4.  When a process terminates.

-   In cases 1 and 4, we must choose a process from the ready queue,
    whereas in case of 2 and 3, this need not always be the case. We
    refer the former case as **nonpreemtive** or **cooperative** and the
    latter as **preemptive**.

    In case of a nonpreemptive scheduling, once the CPU has been
    allocated a process, the process keeps the CPU until it releases the
    CPU by either terminating or switching to the waiting state. In case
    of preemptive scheduling, a process can be sort of forced out of
    the CPU.

-   Scheduling criteria:

    1.  CPU utilization: keep CPU as busy as possible.

    2.  Throughput: Number of processes completed during unit time.

    3.  Turnaround time: the time taken to execute a process, i.e., the
        time between starting and ending of a process.

    4.  Waiting time: sum of periods of time spent in the ready queue.

    5.  Response time: time time from the submission of request
        (ready request?) until first response is produced.

-   **First-Come First-Server scheduling**:

    In this scheme, the process that requests the CPU first is allocated
    it first. This can be easily implemented using a queue. The obvious
    disadvantage is that the average waiting time is long. Another case
    where there is a disadvantage is the following: one CPU intensive
    job and many IO intensive jobs; here if the CPU intensive job is
    allotted CPU first, then CPU might remain idle afterwards, which is
    a waste. Note that this algorithm is preemptive, i.e., once a
    process has been allotted CPU, it keeps the CPU until it terminates
    and thus is troublesome for time sharing systems, where it is
    important that each user get a share of CPU at regular intervals.

-   **Shortest-Job-First Scheduling**:

    When the CPU is available, the scheduler shall assign it to the
    process that has the smallest next CPU burst; if two processes have
    the same CPU burst, we break the tie by using FCFS scheduling.

    This algorithm shall minimize the average waiting time of processes
    (something that FCFS cannot do.) The obvious problem with this is
    that one cannot exactly estimate the next CPU burst, hence this is
    actually approximated.

&lt;2015-08-04&gt;
==================

-   In shortest job first algorithm, there is no real way to find out
    what the exact value of the next CPU burst is. So if $t_n$ is the
    length of the \$n\$th CPU burst and $\tau_{n}$ be the predicted
    value of the \$n\$th CPU burst, then we may predict the value of
    \$n+1\$the CPU burst by the formula $\tau_{n+1} =\alpha t_n +
     (1-\alpha)\tau_n$. The formula defined above is called as
    **exponential average**.

-   The SJF algorithm can have two variants: preemptive
    and non-preemptive. The non-preemptive SJF is also known
    as shortest-remaining-time-first-scheduling.

-   **Priority Scheduling**: this is a generalization of SJF, here the
    priority can be anything (not just shortest CPU burst). For example,
    the priority might be 1/CPU-Burst or IO-Burst/CPU-Burst (processes
    with high value of this metric are likely to be interactive program;
    thus giving priority to this metric means that interactive programs
    are more favored over, say, batch programs.)

-   Priority scheduling can be either preemptive and non-preemptive.

-   The major problem with priority scheduling is indefinite blocking
    or starvation. That is, if a process has a low priority and that a
    stream of high priority processes are always inserted into the
    queue, then this process is never executed, which is bad. The
    solution to this problem is **Aging**, i.e., we shall gradually
    increase the priority of a process that has been waiting for a
    long time.

-   In priority scheduling, we may use FCFS to break the tie, in case
    two processes have the same priority.

-   **Round-Robin Scheduling**: in this scheduling algorithm, there is a
    time-slice, i.e., a fixed amount of time through which a process
    can execute. After a process completes its time-slice, it is then
    send back to the bottom of the queue. Note that if the process
    terminates before the time-slice, then the next process in the queue
    is allowed to execute immediately.

-   Round-robin scheduling is designed especially for
    time-sharing systems. This is usually implemented using a First In
    First out queue. It is easy to see that RR algorithm is preemptive.

-   Note that the ratio average-waiting-time/time-slice need not
    be monotonous.

-   **Multilevel Queue Scheduling**: here there is a classification
    between processes, and each partition has separate queue. For
    example, we may classify processes as **foreground** (interactive)
    and **background** (batch), and create queue for each of the.

    Usually various queues have different scheduling algorithm (the
    foreground-queue may be scheduled by RR algorithm and the background
    queue by FCFS algorithm.) Another possibility is the time-slice
    among the queues. For instance, the foreground queue may be given 80
    percent of CPU time and the remaining for the background queue.

-   **Multilevel Feedback-Queue Scheduling**: in the previous case,
    process do not move between queues. In this algorithm, processes may
    move from one queue to another, for example, if a process uses too
    much CPU time, then it will be moved to a low-priority queue.

-   Multilevel feedback-queue scheduler may be characterized by the
    following:

    1.  Number of queues.

    2.  The scheduling algorithm for each queue.

    3.  The method used to determine when to upgrade a process to a
        higher-priority queue.

    4.  The method used to determine when to demote a process to a lower
        priority queue.

    5.  The method used to determine which queue a process will enter
        when that process needs a service.

&lt;2015-08-05&gt;
==================

-   Usually system calls are executed in Kernel mode. There is a single
    bit called mode bit which is used to identify the mode of
    the process. This has a similar structure of execution with the
    interrupt, but the main difference between interrupts and system
    calls is that system calls are done voluntarily while the interrupts
    are most often involuntary.

-   **Concurrency and Parallelism**: In concurrent process, there will
    be one agent or a few agents and many processes while in parallel
    process, the ratio of the agents and process will be almost one,
    i.e., real parallelism happens in parallel processing while
    concurrent processing merely imitates the parallelism by
    continuously switching between processes.

-   **Interprocess Communication**: A process executing concurrently
    might be independent, i.e., it cannot affect of be affected by the
    other processes executing in the system (a process that do not share
    data is independent.) The opposite is called cooperating process,
    i.e., it can affect or be affected by other processes (a process
    that share data with other processes is cooperating.)

-   Why process cooperation?

    1.  **Information sharing**: same piece of information is shared.

    2.  **Computational speedup**: one may break a task into sub-tasks
        which may be executed in a parallel manner to provide a speedup.

    3.  **Modularity**.

    4.  **Convenience**.

-   There are two ways in which cooperation between processes can
    happen:

    1.  **Shared memory**: processes read and write data to some memory
        that is common to all of them.

    2.  **Message passing**: messages are exchanged between
        cooperating processes.

-   The shared memory model is faster than message parsing since the
    former often do not require kernel intervention while the
    latter does.

-   **Shared-memory systems and the producer consumer problem**:

    The producer process produces information that is consumed by a
    consumer process. How do we implement such a scenario? One solution
    to implementing this is using shared memory.

    The obvious way to implement this is have a shared buffer in which
    things that are produced are stored and the consumer will fetch
    things from this buffer. In case of a bounded buffer, if the buffer
    is full the producer has to wait , and similarly when the buffer is
    empty, the consumer has to wait. We may implement this feature by
    having a counter and doing `while(counter ==
     BUFFER_SIZE);` and `while(counter == 0);` in producer and
    consumer respectively. Here once new items are produced or when
    items are consumed, we have to increment and decrement the
    counter respectively.

    The problem is that, the `counter++` or `counter--` is not an
    atomic instruction. Atomically, it boils down to copying value the
    counter to a register, incrementing the register and then assign the
    incremented value to counter. What if after assigned value to
    register, a context switch occur? Clearly this isn't going to work
    properly in certain cases.

    Situations like these are known as **race condition**, where the
    value of some variable depends on a random event (we don't know if a
    context switch is going to happen.)

-   In case of cooperating process, there are sections within the code
    whose execution should be done in one go. For example, in the
    previous case it was `counter++` (this is an easy example; I guess
    in practice, the section can be much larger.) We call this part as
    **critical section**. So the main problem is that at a time only one
    process's critical section should be allowed to execute.

-   Our requirements:

    1.  **Mutual exclusion**: If a process $P$ is executing in critical
        section, then no other coordinating process can be executing in
        its critical sections.

    2.  **Progress**: If no other processes are executing in the
        critical section, then only the processes that are not executing
        in the remainder section can participate in decided which
        process takes the next turn and this selection cannot be
        postponed indefinitely.

    3.  **Bounded waiting**: There should be an upper bound on the
        number of times other processes are allowed to enter their
        critical sections after a process has made a request to enter
        its critical section and before that request is granted. (I
        think basically, we want the timer-interrupt to still work even
        if a process is in critical section, i.e., even if a process is
        executing in its critical section, after a period of time the
        scheduler must be allowed to switch context)

-   One way of handling the critical section is to disable all
    interrupts and re-enable them once we are done executing the
    critical section. This problem ensures mutual exclusion, but does
    not guarantee that the waiting time is bounded. I also think that
    disabling all interrupts are bad since if you want to kill the
    process it must die immediately (![](http://i.imgur.com/6u3dd.png).)
    The book mentions that disabling interrupts is a
    time-consuming process.

-   Many modern computer systems (the hardware) provides an atomic
    instruction called the `TestAndSet(boolean *target)`, this basically
    returns the value of the variable `lock` (the shared variable).
    Suppose several processes want to execute the critical section of
    the code, now they will first have to make sure that the value of
    the lock variable is false and then make it true (this means that
    that process can start executing its critical section.)

-   Another way is to use an atomic `swap()` instruction. Here the
    `lock` variable is shared and processes will have a local
    `key` variable. Here we continuously swap the values of lock and key
    and stops when the value of key is false. This method is merely a
    variant of the previous one.

-   Another nice way is illustrated in page 199 in the text book (mostly
    contains code).

&lt;2015-08-06&gt;
==================

-   It should be noted that the solutions that were presented required
    hardware support to make sure that `swap`, `TestAndSet` were
    executed atomically.

-   **Semaphores**: This method does not require hardware support and
    can also be programmed. Semaphore is a variable that can only be
    accessed through two standard functions, `wait()` and `signal()`.
    The wait operation and the signal operation are also known as P and
    V respectively.

-   The wait function merely executes an empty while loop until the
    value of S becomes positive, after than it decrements the value
    of S. The signal function merely increments the value of S.

-   Constraints:

    1.  All modifications to the integer valued semaphore must be
        executed indivisibly, i.e., when one process modifies the value
        of the semaphore, no other process can modify the value of it.

    2.  In case of wait function, testing of value S, i.e, S &lt;= 0 and
        its possible modification S-- must be executed
        without interruption.

-   Types of semaphore:

    1.  Binary semaphore: the value can range between 0 and 1. Also
        known as mutex locks.

    2.  Counting semaphore: the value can range over
        unrestricted domain.

-   So solve the critical section problem, we can employ a mutex. Here
    before the critical section, we shall call the `wait()` function and
    after the critical section we shall call the `signal()` function.

-   **The Dining Philosophers Problem**: Consider 5 dining \[Chinese\]
    philosophers using a circular dining table. These philosophers,
    obviously, eats or thinks; philosophers do not eat and think nor
    think and eat. There are 6 chopsticks, each philosopher has a
    chopstick to his right and one to his left. He can only eat if he
    get hold of both the chopstick. The problem is to design a protocol
    that is both deadlock-free and starvation-free. For example:
    consider the protocol in which if a philosopher wants to eat, she
    picks the right chopstick first and then the left chopstick; this
    can cause a deadlock when each of them changes state from thinking
    to eating at once (here all of them will have a right chopstick, but
    none of them will get a pair), a dead lock.

-   Some solutions:

    -   Allow at most four philosopher to be sitting simultaneously at
        the table (then follow the solution mentioned as an example.)

    -   Allow a philosopher to pick up her chopsticks only if both
        chopsticks are available (critical section).

    -   Odd philosopher picks up left chopstick and then her right
        chopstick, while the even philosopher picks her right chopstick
        and then right chopstick.

-   Even though the last bullet suggests deadlock free solutions, they
    do not guard the possibility of a philosopher starving to death.

&lt;2015-08-11&gt;
==================

-   **Bounded buffer problem**: this is the good old producer
    consumer problem. We have a pool of $n$ buffers, each capable of
    holding one item, the producer can produce an item and store it in
    the item, the consumer can consume an item from the the buffer.
    Obviously, a producer cannot produce if all the buffers are full and
    a consumer cannot consume when all the buffers are empty.

    One can make use of semaphores to solve this
    synchronization problem. We need a mutex and two counting semaphores
    called `full` and `empty`. The full is initialized to $n$ and the
    empty is initialized to $0$ at the beginning.

    Basically, the producer shall produce an item and before adding it
    to the buffer, it shall wait for the `empty` semaphore. Then it
    shall wait for the `mutex` to add the item to the buffer. After
    adding, it shall release the `mutex` semaphore and further release
    the full semaphore.

    The consumer, on the other hand, waits for the `full` semaphore and
    `mutex` to remove an item from the buffer. After removing, it shall
    then release the mutex and `empty` semaphore.

    For pseudo-code, refer to page 205 in the book.
-   **Readers-Writers problem**: There are two variants of this problem
    1.  First readers-writers problem: no reader shall be kept waiting
        unless a writer has already obtained permission to use the
        shared object.

        This can be implemented using a `mutex` and `wrt` (both binary
        semaphores, initialized to 1), and a `readcount` variable which
        is an integer.

        The `wrt` semaphore ensures mutual exclusion between writers and
        the mutex ensures mutual exclusion when the read count
        is updated.

        Refer to page 207 of the text for details.
    2.  Second readers-writers problem: once a writer is ready, no
        reader should for for other readers to finish, so that writer
        can get the control as soon as possible.

&lt;2015-08-20&gt;
==================

-   **Peterson's solution**: For two process, $P_0$ and $P_1$, we share
    the two variables `int turn` and `bool turn[2]`. For convenience if
    $i$ denote the index of one of the process, then $j$ shall denote
    the index of the other process.

    The value of `flag[i]` indicates that the process wishes to get into
    the critical section. After making `flag[i] = TRUE`, we shall set
    the value of turn to be j and do a `while(flag[j] && turn == j)`.
    After this empty while loop breaks the critical section begins and
    `flag[i] = FALSE` shall denote the end of CS.

    This solution shall ensure Mutual Exclusion, for to break the while
    loop, either `flag[i] == FALSE` (this means that the other process
    has successfully completed executing its critical section.) If the
    value of `turn` is not j, this means that one of the process will be
    inside the while loop while the other will be able to execute the
    critical section and once it finishes execution of CS, it shall
    change the value of flag.

    The book also shows that progress requirement and bounded waiting is
    also met, though I wasn't able to fully comprehend it.
-   **Busy wait**: While a process is in critical section, other
    processes must loop continuously in the entry code, i.e., CPU
    wastage happens.
-   **Implementing a semaphore**: A semaphore implementation that busy
    waits is known as **spinlock**; these have an advantage that there
    is no context switch that has to take place when a process must wait
    for a lock which can be useful since context switches can often
    consume time and resources.

    The semaphore can be implemented as a C structure with an integer
    element value and a pointer to a list (the value variable stores the
    number of elements in the list.) When a process waits for a
    semaphore, it is added to a list. Further, a signal () operation
    removes one process from the list of waiting process and awakens
    the process. (Refer to page 202, for sample code for the wait and
    signal functions)

    But it should be guaranteed that the wait and signal functions are
    executed atomically (In pintos, I think that it does this by
    disabling interrupts.)

&lt;2015-08-25&gt;
==================

(Did not go to class.)

-   Semaphores, when incorrectly used can lead to some nasty bugs. To
    solve this problem, a "high-level" synchronization construct was
    constructed, it is called the **monitor** type.

-   To synchronize, we can define a variable of type condition where
    this variable can have two operations, `wait` and `signal`.

    The wait operation means that the process invoking this operation is
    suspended until another process invokes the signal operation.

    The signal operation, when invoked shall resume exactly one
    suspended process. If no processes are suspended, then the signal
    operation has no effect. Notice that this need not be the case
    with semaphores.

    If the signal operation is invoked by a process P, then there is a
    suspended process Q that shall be executed. But then if Q is allowed
    to be executed and when P already has the monitor, P must wait or
    that P must be allowed to continue and Q waits until P leaves
    the monitor. These cases are respectively referred to as **signal
    and wait**, and **signal and continue**.

-   **Dining philosophers using monitors**: We shall describe the state
    of the philosopher using an enum (the possible states are thinking,
    hungry and eating.) The variable can only be changed if her two
    neighbors are not eating. (The indices corresponding to neighbors of
    $i$ are $(i+4) % 5$ and $(i+1) % 5$.)

&lt;2015-09-01&gt;
==================

-   CPU can directly access only main memory and registry.

-   We have to make sure that each process has a separate memory space
    so that we can ensure that the memory doesn't get corrupted by
    other applications. To do this, we have two registers, the base
    register holds the smallest legal physical memory address and the
    limit register specifies the size of the range.

    To ensure protection, we can simply check whether the address
    generated by a process lies in its range and if it doesn't this
    results in an error.

-   **Address Binding**

    Addresses in the source program is generally symbolic (relative) and
    the compiler has to bind these symbolic addresses to relocatable
    addresses (eg: 14 bytes beginning from this module). After that the
    loader or the linkage editor binds the relocatable address to
    absolute address (like 237343 in Main memory.)

    -   **Compile time**: if, at compile time, it is known where a
        process will reside in memory, then the **absolute code** can
        be generated.

    -   **Load time**: if, at compile time, it is **not** known where a
        process will reside in memory, then the compiler should generate
        **relocatable code** and the final binding is delayed until
        load time.

    -   **Execution time**: if the process can be moved during its
        execution time from one memory segment to another, then the
        binding must be delayed until the run time. Special hardware
        should be made available; used in most general purpose OS.

-   The address generated by CPU is called **logical address** or
    **virtual address** while the address seen by memory unit, i.e., the
    address that is loaded into the **memory-address register** of the
    memory is referred to as **physical address**.

    The set of all logical address generated by a program is a **logical
    address space**, similarly we can define **physical address space**.
    In case of execution-time address-binding scheme, the logical and
    physical address space can differ.

    The run time mapping of a logical addresses to physical addresses is
    done by a hardware device called **memory management unit** (MMU).

    Example of working of MMU: let us call base register by relocation
    register and the value of the relocation register is added to the
    every address that the user generates.

-   **Dynamic loading**:


