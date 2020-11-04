pragma solidity >=0.4.24;


interface IRewardEscrowV2 {
    // Views
    function balanceOf(address account) external view returns (uint);

    function numVestingEntries(address account) external view returns (uint);

    function totalEscrowedAccountBalance(address account) external view returns (uint);

    function totalVestedAccountBalance(address account) external view returns (uint);

    function getVestingScheduleEntry(address account, uint index) external view returns (uint[2] memory);

    // Mutative functions
    function appendVestingEntry(address account, uint quantity) external;

    function migrateVestingSchedule(address _addressToMigrate) external;

    function migrateAccountEscrowBalances(
        address[] calldata accounts,
        uint256[] calldata escrowBalances,
        uint256[] calldata vestedBalances
    ) external;

    // L2 Migration
    function importVestingEntries(
        address account,
        uint64[] calldata timestamps,
        uint256[] calldata amounts
    ) external;

    function burnForMigration(address account) external returns (uint64[52] memory, uint256[52] memory);

    function vest(address account) external;
}
