//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;

    mapping(address => bool) public voters;

    function addCandidate(string memory name) public {
        candidates.push(Candidate(name, 0));
    }

    function vote(uint256 candidateIndex) public {
        require(candidateIndex >= 0 && candidateIndex < candidates.length, "Invalid candidate index");
        require(!voters[msg.sender], "The sender has already voted");

        candidates[candidateIndex].voteCount += 1;
        voters[msg.sender] = true;
    }

    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    function getCandidate(uint256 candidateIndex) public view returns (string memory name, uint256 voteCount) {
        require(candidateIndex >= 0 && candidateIndex < candidates.length, "Invalid candidate index");

        Candidate storage candidate = candidates[candidateIndex];
        return (candidate.name, candidate.voteCount);
    }
}
