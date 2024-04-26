<?php

return [
    [
        '$123.46',
        123.456,
        '$#,##0.00',
    ],
    [
        '$-123.46',
        -123.456,
        '$#,##0.00',
    ],
    [
        '123.46',
        123.456,
        '#,##0.00',
    ],
    [
        '123',
        123.456,
        '#,##0',
    ],
    [
        '00123',
        123.456,
        '00000',
    ],
    [
        '$123,456.79',
        123456.789,
        '$#,##0.00',
    ],
    [
        '123,456.79',
        123456.789,
        '#,##0.00',
    ],
    [
        '1.23E+5',
        123456.789,
        '0.00E+00',
    ],
    [
        '-1.23E+5',
        -123456.789,
        '0.00E+00',
    ],
    [
        '1.23E-5',
        1.2345E-5,
        '0.00E+00',
    ],
    [
        '1960-12-19',
        '19-Dec-1960',
        'yyyy-mm-dd',
    ],
    [
        '2012-01-01',
        '1-Jan-2012',
        'yyyy-mm-dd',
    ],
    'time (issue 3409)' => [
        '09:01:00',
        '09:01',
        'HH:MM:SS',
    ],
    'datetime' => [
        '15-Feb-2014 04:17:00 PM',
        '2014-02-15 16:17',
        'dd-mmm-yyyy HH:MM:SS AM/PM',
    ],
    [
        '1 3/4',
        1.75,
        '# ?/?',
    ],
    'no arguments' => ['exception'],
    'one argument' => ['exception', 1.75],
    'boolean in lieu of string' => ['TRUE', true, '@'],
];
