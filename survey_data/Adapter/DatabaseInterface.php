<?php


namespace Adapter;


interface DatabaseInterface
{
    public function prepare($sql): DatabaseStatementInterface;

    public function lastId();

    public function errorInfo();

    public function escapeData(string &$value): string;

    public function printData(string &$value): string;

    public function cleanData(array $useData): array;
}
